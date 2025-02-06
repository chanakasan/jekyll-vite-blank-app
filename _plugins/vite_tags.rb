module Jekyll
  class NxViteJsTags < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def dist_dir
      "vite_dist"
    end

    def render(context)
      set_jekyll_env(context)
      set_manifest(context)
      # binding.pry
      output = ''
      if jekyll_env == 'development'
        output = dev_scripts
      else
        output = prod_scripts
      end
      output
    end

    def dev_scripts
      str = %Q(
        <script type="module" src="http://localhost:5173/@vite/client"></script>
        <script type="module" src="http://localhost:5173/main.js"></script>
      )
      str
    end

    def prod_scripts
      str = %Q(
        <link rel="stylesheet" href="/#{manifest_entry_css}" />
        <script type="module" src="/#{manifest_entry_file}"></script>
      )
      str
    end

    def manifest_entry_css
      manifest_entry[:"css"].to_a.first
    end

    def manifest_entry_file
      manifest_entry[:"file"]
    end

    def manifest_entry
      @manifest[:"main.js"]
    end

    def manifest
      @manifest
    end

    def jekyll_env
      @jekyll_env
    end
    
    def set_jekyll_env(context)
      @jekyll_env = context["jekyll"]["environment"]
    end

    def set_manifest(context)
      return if jekyll_env == "development"
      base = context['site']['source']
      path = "#{base}/#{dist_dir}/manifest.json"
      file = File.read(path)
      @manifest = json_parse(file)
    end

    def json_parse(file)
      JSON.parse(file, {symbolize_names: true})
    end
  end
end

Liquid::Template.register_tag('nx_vite_js_tags', Jekyll::NxViteJsTags)