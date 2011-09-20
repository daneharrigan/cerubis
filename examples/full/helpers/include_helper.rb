module IncludeHelper
  def include(name)
    full_path = "#{template_root}/_#{name}.cerubis"
    if File.exists?(full_path)
      template = File.read(full_path)

      Cerubis.render(template, context)
    end
  end

  private
    def template_root
      @template_root ||= File.expand_path(File.dirname(__FILE__) + '/../templates')
    end
end
