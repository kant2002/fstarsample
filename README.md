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
