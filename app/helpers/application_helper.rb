module ApplicationHelper
  def show_logo
    content_tag(:a, class: "logo") do
      concat(
        content_tag(:span) do
          concat("Vox")
          concat(
            content_tag(:span) do
              "hood"
            end
          )
        end
      )
    end
  end
end
