# README

## 编译

``` sh
cmake . -B build -DCMAKE_BUILD_TYPE=Debug
# 或 Release
# cmake . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build
```

## 执行

``` sh
./out/debug/bin/example-test
```

## 约定

1. 多个项目的源码分别放入 `src` 的子目录中。目录名和项目名称一致。
1. 如果项目目录不包含 `CMakeLists.txt` 则会自动创建项目。在此基础上，如果包含 `main.cpp` 则会创建为可执行程序项目，否则为动态库项目。会收集项目根目录和项目 `src` 子目录里的 `*.c`、`*.cc` 和 `*.cpp` 作为源码。注意自动创建的项目并不会调用 `target_include_directories`，并且也不处理链接关系。
1. 如果项目目录包含 `CMakeLists.txt` 则会自动创建项目。

## Visual Studio Code 相关的配置

### c_cpp_properties.json

c_cpp_properties.json 是 Visual Studio Code 中用于配置 C/C++ 项目的文件。它的主要作用是为代码补全、语法检查和 IntelliSense 功能提供准确的代码分析和智能提示。

具体来说，c_cpp_properties.json 文件用于配置以下内容：

包含路径（includePath）：指定编译器在搜索头文件时要查找的路径。通过提供正确的包含路径，可以让编辑器准确地识别和定位项目中的头文件，从而实现正确的代码补全和语法检查。

宏定义（defines）：指定在预处理过程中要定义的宏。这些宏可以影响代码中的条件编译和预处理指令，从而确保编辑器在进行静态分析时正确地处理代码逻辑。

编译器路径（compilerPath）：指定用于编译源代码的编译器可执行文件的路径。这对于 Visual Studio Code 插件来说很重要，因为它需要知道要使用哪个编译器来执行编译任务。

标准版本（cStandard、cppStandard）：指定所使用的 C 和 C++ 标准的版本。这可以帮助编辑器在语法检查和代码补全时使用正确的规则和特性。

通过提供准确的 c_cpp_properties.json 配置，Visual Studio Code 的 C/C++ 插件可以更好地理解和分析你的代码，提供更准确和有用的代码补全、语法检查和 IntelliSense 提示。

### launch.json

launch.json 是 Visual Studio Code 中用于配置调试器的文件。它的主要作用是定义和配置调试会话，使你能够在 Visual Studio Code 中进行代码调试和查看程序的运行状态

具体来说，launch.json 文件用于配置以下内容：

调试器类型（type）：指定要使用的调试器类型，例如 "cppdbg"（C++ 调试器）、"node"（Node.js 调试器）、"python"（Python 调试器）等。每种调试器类型都有其特定的配置选项和行为。

调试目标（program）：指定要调试的可执行文件的路径。调试器将启动该可执行文件并在其上下文中执行调试操作。

调试器选项和配置：根据所选调试器类型，你可以配置各种调试器选项，如命令行参数（args）、工作目录（cwd）、环境变量（env）、远程调试设置等。这些选项可以影响调试器的行为和调试过程的细节。

断点设置：可以在 launch.json 文件中设置断点，即在代码中指定要暂停执行的位置。断点允许你逐步执行代码，并观察变量的值和程序的状态。

通过适当配置 launch.json 文件，你可以在 Visual Studio Code 中启动调试会话，与程序进行交互，逐步调试代码，观察变量值，查看调用堆栈等。这对于定位和解决代码中的问题非常有用。

需要注意的是，launch.json 文件通常与其他配置文件（如 tasks.json、c_cpp_properties.json 等）一起使用，以构建完整的开发环境配置。这样可以确保代码补全、语法检查、自动构建和调试等功能能够协同工作，提供更好的开发体验。

### tasks.json

tasks.json 是 Visual Studio Code 中用于配置任务（Tasks）的文件。它的主要作用是定义和配置在开发过程中执行的自动化任务，如编译、构建、运行、部署等。

具体来说，tasks.json 文件用于配置以下内容：

任务类型（type）：指定任务的类型，如 "shell"（运行 shell 命令）、"process"（运行可执行文件）、"grunt"（运行 Grunt 任务）等。

命令和参数（command、args）：定义任务要执行的命令和相应的参数。这些命令可以是编译器命令、构建工具命令、脚本命令等，根据任务类型的不同而异。

工作目录（cwd）：指定任务执行时的工作目录，即命令要在哪个目录下执行。这可以影响命令的执行结果和文件路径解析。

问题匹配器（problemMatcher）：配置用于解析任务输出并识别错误和警告信息的问题匹配器。这使得 Visual Studio Code 能够在问题面板中显示和导航到任务产生的问题。

预定义变量（predefined variables）：可以使用预定义变量（如 ${workspaceFolder}、${file}、${fileBasename} 等）来引用工作区路径、当前文件路径等。这使得任务配置可以根据具体的上下文和文件动态调整。

通过适当配置 tasks.json 文件，你可以执行各种开发过程中的自动化任务，并且能够与其他功能（如调试、代码补全等）结合使用，提高开发效率。
