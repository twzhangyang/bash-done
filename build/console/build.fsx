#r "paket:
nuget FSharp.Core
nuget Fake.DotNet.Cli
nuget Fake.IO.FileSystem
nuget Fake.Core.Target //"
#load ".fake/build.fsx/intellisense.fsx"

open Fake.Core
open Fake.DotNet
open Fake.IO.Globbing.Operators
open System.IO
open Fake.Core.TargetOperators

Target.create "Clean" (fun _ -> 
  Trace.log " --- Cleaning stuff ----"
  DotNet.exec id "clean" ""
  |> ignore
)

Target.create "Build" (fun _ ->
  Trace.log " --- Building the app ---"
  DotNet.build id ""
)

Target.create "Test" (fun _ ->
  Trace.log " --- Testing project in parallel ---"

  let setDotNetOptions (projectDirectory:string) : (DotNet.TestOptions -> DotNet.TestOptions) =
    fun (dotNetTestOptions: DotNet.TestOptions) ->
    {
      dotNetTestOptions with
        Common = { dotNetTestOptions.Common with WorkingDirectory = projectDirectory }
        Configuration = DotNet.BuildConfiguration.Release
    }

  !!("test/**/*.Tests.csproj")
  |> Seq.toArray
  |> Array.Parallel.iter (
    fun fullCsProjName ->
      let projectDirectory = Path.GetDirectoryName(fullCsProjName)
      DotNet.test (setDotNetOptions projectDirectory) ""
  )  
)

Target.create "Publish" (fun _ ->
  Trace.log " --- Publishing app --- "

  let setPublishParams (defaultPublishParams : DotNet.PublishOptions) =
    {
      defaultPublishParams with 
        Common = { defaultPublishParams.Common with WorkingDirectory = "src\\Poc.Cli"}
    }

  DotNet.publish setPublishParams "Poc.Cli.csproj" 
)

Target.createFinal "Done" (fun _ ->
  Trace.log " --- Fake script is done ---"
)

"Clean"
  ==> "Build"
  ==> "Test"
  ==> "Publish"
  ==> "Done"

Target.runOrDefault "Done"