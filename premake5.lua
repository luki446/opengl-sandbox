workspace "Opengl-Sandbox"
    architecture "x64"
    configurations { "Debug", "Release"}
    platforms { "Win64" }

project "Glad"
    kind "StaticLib"
    language "C"

    includedirs "ext/glad/include/"

    files { "ext/glad/src/glad.c" }

project "GLFW"
    kind "StaticLib"
    language "C"

    includedirs "ext/glfw/include/"

    files {"ext/glfw/src/*.c", "ext/glfw/src/*.h"}

    defines { "_GLFW_WIN32" }

project "Opengl-Sandbox"
    kind "ConsoleApp"
    language "C++"
    architecture "x86_64"
    targetdir "bin/%{cfg.buildcfg}"

    includedirs {
        "ext/glad/include",
        "ext/glfw/include/",
        "ext/glm/"
    }

    links { "GLFW", "Glad", "OpenGL32" }

    files { "src/*.h", "src/*.c", "src/*.cpp", "src/*.hpp" }

    filter "configurations:Debug"
        defines { DEBUG }
        symbols "On"

    filter "configurations:Release"
        defines { RELEASE }
        optimize "On"
