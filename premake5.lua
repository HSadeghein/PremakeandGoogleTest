workspace "Example"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.architecture}"
IncludeDir = {}
IncludeDir["googletest"] = "googletest/googletest/include"
LibDir = {}
LibDir["googletest"] = "googletest/googletest/build/lib/Debug"

	
project "sample"
	location "sample"
	language "C++"
	kind "ConsoleApp"
	runtime "Debug"
	staticruntime "on"

	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{IncludeDir.googletest}"
	}
	libdirs
	{
		"%{LibDir.googletest}"

	}
	links
	{
		"gtest_maind",
		"gtestd"
	}
