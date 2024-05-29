defmodule DeployToRenderWeb.TestLive do
	use DeployToRenderWeb, :live_view

	def mount(_params, _session, socket) do
		{:ok, socket}
	end

	def render(assigns) do
		~H"""
		I'm a LiveView!
		"""
	end
end
