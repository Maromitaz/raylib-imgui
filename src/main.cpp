#include <external/fix_win32_compatibility.h>
#include <raylib.h>
#include <imgui.h>
#include <imgui_impl_glfw.h>
#include <imgui_impl_opengl3.h>
#include <GLFW/glfw3.h>

void _main()
{
	InitWindow(1200, 800, "Hello world!");

	IMGUI_CHECKVERSION();
	ImGui::CreateContext();
	
	ImGuiIO& io = ImGui::GetIO(); (void)io;
	
	io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard | ImGuiConfigFlags_NavEnableGamepad;

	ImGui::StyleColorsDark();

	ImGui_ImplGlfw_InitForOpenGL(
	    GetGLFWwindowHandle(), 
	    true
	);
	ImGui_ImplOpenGL3_Init("#version 330");

	bool show = false;

	while(!WindowShouldClose())
	{
	    BeginDrawing();
	        ClearBackground({ 0xff, 0xff, 0x00, 0xff });

	        ImGui_ImplOpenGL3_NewFrame();
	        ImGui_ImplGlfw_NewFrame();
	        ImGui::NewFrame();

			ImGui::SetNextWindowSize({ 400, 400 });
			ImGui::Begin("Hello world!", nullptr, 0);
			ImGui::Text("Liviu este gei");
			if (ImGui::Button("Hello, there!", { 100, 50 }))
			{
				show = !show;
			}
			if (show) ImGui::Text("I'm being shown!");
			ImGui::End();

	        ImGui::Render();
	        ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());

	    EndDrawing();
	}
	ImGui_ImplOpenGL3_Shutdown();
	ImGui_ImplGlfw_Shutdown();
	ImGui::DestroyContext();
	RLCloseWindow();
}
