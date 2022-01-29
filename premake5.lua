project "GLFW"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" .. outputdir .. "/%{project_name}")
	objdir ("bin-int/" .. outputdir .. "/%{project_name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c",
		"src/platform.c",
		"src/null_init.c",
		"src/null_joystick.c",
		"src/null_monitor.c",
		"src/null_window.c",

	}
	
	filter "configurations:Debug"
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		buildoptions "/MD"
		optimize "On"

	filter "configurations:Dist"
		buildoptions "/MD"
		optimize "On"

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

		files
		{
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/win32_module.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}

		defines
		{
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}
