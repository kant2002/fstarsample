F* sample
=========

This is sample how to use new Nuget package for Ulib.
This repo is to test how things would work, and from that point move toward publishing process.

For now I place ulibfs package to the Myget, once things become stable and both me and F* team are happy,
I would work on publishing process.

# How to get started

Define environment variable `FSTAR_HOME` for root folder of FStar installation.

```xml
<configuration>
  <packageSources>
	<add key="fstar-experimental" value="https://www.myget.org/F/fstar/api/v3/index.json" />
  </packageSources>
</configuration>
```

then switch to project directory and run usual .NET commands.

```bash
dotnet restore
dotnet run
```

Currently you may notice that each project require to have `fsharp.extraction.targets` file. That's unfortunate until I push build scripts for F* SDK so you can have

```xml
<Project Sdk="FStarLang.Sdk">
  <PropertyGroup>
    <TargetFramework>net6.0</TargetFramework>
  </PropertyGroup>
  <ItemGroup>
    <Compile Include="Program.fst" />
  </ItemGroup>
  <ItemGroup>
    <PackageReference Update="FStar.Ulib" Version="1.0.0" />
    <PackageReference Update="FSharp.Core" Version="4.3.4" />
  </ItemGroup>
</Project>
```
