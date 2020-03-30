#r "paket:
nuget Fake.Core.Target //"
#load "./.fake/build.fsx/intellisense.fsx"

open Fake.Core

Target.create "Clean" (fun _ ->
    Trace.log " --- Cleaning stuff --- "
)

Target.create "Build" (fun _ -> 
    Trace.log " --- Building the app ---"
)

Target.create "Deploy" (fun _ ->
    Trace.log " --- Deploying app ---"
)

Target.create "Default" (fun _ -> 
    Trace.trace "Hello world from FAKE"
)

open Fake.Core.TargetOperators

"Clean"
    ==> "Default"
    ==> "Build"
    ==> "Deploy"

Target.runOrDefault "Deploy"
