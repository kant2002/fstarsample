F* sample
=========

This is sample how to use new Nuget package for Ulib.
This repo is to test how things would work, and from that point move toward publishing process.

For now I place ulibfs package to the Myget, once things become stable and both me and F* team are happy,
I would work on publishing process.

# How to get started

Define environment variable `FSTAR_HOME` for root folder of FStar installation.

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <!--To inherit the global NuGet package sources remove the <clear/> line below -->
    <clear />
    <add key="nuget" value="https://api.nuget.org/v3/index.json" />
  </packageSources>
</configuration>
```

Create new global.json, or add `msbuild-sdks` values as shown below.
```json
{
  "msbuild-sdks": {
    "FStarLang.Sdk": "0.1.2"
  }
}
```

then switch to project directory and run usual .NET commands.

```bash
dotnet restore
dotnet run
```

This sample working using MSBuild SDK from this repo: https://github.com/kant2002/FStarMSBuildSdk

## Notes

`printf` sample does not working. It's hitting https://github.com/FStarLang/FStar/issues/2650 and also require https://github.com/FStarLang/FStar/pull/2656 (landed master, not released). 
So please wait.

`gc` sample is very much barebone. I would like to make closer to https://github.com/dotnet/runtime/blob/main/src/coreclr/gc/sample/GCSample.cpp in spirit. On the other side, this sample show how you can mix F* and F#

`CryptoCore` sample extracts, but does not have working code. This is for my personal testing.

Currently export can work only on F# 5.0, please set this language `<LangVersion>5.0</LangVersion>` in the project.