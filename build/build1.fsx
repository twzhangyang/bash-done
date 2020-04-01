#r "paket:
nuget Fake.DotNet.Cli
nuget Fake.IO.FileSystem
nuget Fake.Api.GitHub
nuget Fake.DotNet.Testing.NUnit
nuget Fake.Core.Target //"
#load ".fake/build.fsx/intellisense.fsx"
open Fake.Core
open Fake.DotNet
open Fake.IO
open Fake.IO.Globbing.Operators
open Fake.Core.TargetOperators
open Fake.Api
open Fake.Testing

Target.initEnvironment ()

Target.create "Clean" (fun _ ->
    !! "src/**/bin"
    ++ "src/**/obj"
    |> Shell.cleanDirs 
)

Target.create "Build" (fun _ ->
    !! "src/**/*.*proj"
    |> Seq.iter (DotNet.build id)
)

// Simple glob using as List

Target.create "Test1" (fun _ -> 
  let csProjectFiles = !! "src/*.csproj"

  for project in csProjectFiles do 
    printf "F# project file: %s" project
)

Target.create "Test2" (fun _ -> 
  let projectFiles =
    !! "src/*/*.*proj"
    ++ "src/*/*.target"
    -- "src/*/*.vbproj"

  for project in projectFiles do 
    printf "Project file: %s" project  
)

Target.create "Test3" (fun _ ->
  !! "src/*/*/obj/**/*.nuspec"
  |> File.deleteAll
)

Target.create "All" ignore

"Clean"
  ==> "Build"
  ==> "Test1"
  ==> "Test2"
  ==> "Test3"
  ==> "All"

Target.runOrDefault "All"


