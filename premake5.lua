local function add_includes()
    includedirs {
        "%{wks.location}/thirdparty/raylib/",
        "%{wks.location}/thirdparty/raylib/external/glfw/include/",
        "%{wks.location}/thirdparty/imgui",
    }
end
workspace "FRP capaign manager"
    configurations { "Debug", "Release", "Dist" }
    platforms { "Win64" }

    targetdir "%{wks.location}/build/bin/%{cfg.buildcfg}/"
    objdir"%{wks.location}/build/obj/%{cfg.buildcfg}/"

    defaultplatform "Win64"
    startproject "app"
    architecture "amd64"

project "app"
    dependson { "imgui" }
    location "%{wks.location}/src"
    kind "ConsoleApp"
    filter { "configurations:Debug"}
        defines { "DEBUG" }
        symbols "On"
    filter { "configurations:Release"}
        defines { "NDEBUG" }
        optimize "On"
    filter { "configurations:Dist"}
        defines { "NDEBUG", "_DIST" }
        optimize "Full"
        kind "WindowedApp"
    filter {}
    language "C++"
    cppdialect "C++23"
    links { 
        "imgui",
    }

    add_includes()

    files {
       "%{prj.location}/main.cpp",
    }

project "imgui"
    dependson { "raylib" }
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    add_includes()

    location "%{wks.location}/thirdparty/imgui"
    files {
        "%{prj.location}/imgui.cpp",
        "%{prj.location}/imgui_draw.cpp",
        "%{prj.location}/imgui_impl_glfw.cpp",
        "%{prj.location}/imgui_impl_opengl3.cpp",
        "%{prj.location}/imgui.cpp",
        "%{prj.location}/imgui_impl_win32.cpp",
        "%{prj.location}/imgui_tables.cpp",
        "%{prj.location}/imgui_widgets.cpp",

        "%{prj.location}/imconfig.h",
        "%{prj.location}/imgui.h",
        "%{prj.location}/imgui_impl_glfw.h",
        "%{prj.location}/imgui_impl_opengl3.h",
        "%{prj.location}/imgui_impl_opengl3_loader.h",
        "%{prj.location}/imgui_impl_win32.h",
        "%{prj.location}/imgui_internal.h",
        "%{prj.location}/imstb_rectpack.h",
        "%{prj.location}/imstb_textedit.h",
        "%{prj.location}/imstb_truetype.h",
    }

    filter { "configurations:Debug"}
        defines { "DEBUG" }
        symbols "On"
    filter { "configurations:Release"}
        defines { "NDEBUG" }
        optimize "On"
    filter { "configurations:Dist"}
        defines { "NDEBUG" }
        optimize "Full"
    filter {}
    links { 
        "raylib",
    }

project "raylib"
    location "%{wks.location}/thirdparty/raylib"
    kind "StaticLib"
    language "C"
    cdialect "C99"

    add_includes()

    defines { 
        "PLATFORM_DESKTOP",
        "_GLFW_WIN32",
     }

    links {
        "winmm",
    }
    files {
        "%{prj.location}/rcore.c",
        "%{prj.location}/utils.c",
        "%{prj.location}/rtext.c",
        "%{prj.location}/rtextures.c",
        "%{prj.location}/rshapes.c",
        "%{prj.location}/rglfw.c"
    }

    filter { "configurations:Debug"}
        defines { "DEBUG" }
        symbols "On"
    filter { "configurations:Release"}
        defines { "NDEBUG" }
        optimize "On"
    filter { "configurations:Dist"}
        defines { "NDEBUG" }
        optimize "Full"
    filter {}