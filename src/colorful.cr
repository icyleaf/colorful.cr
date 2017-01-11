require "./colorful/*"

module Colorful
  extend self

  COLORS = {
    "black"   => 30,
    "red"     => 31,
    "green"   => 32,
    "yellow"  => 33,
    "blue"    => 34,
    "magenta" => 35,
    "cyan"    => 36,
    "white"   => 37
  }

  MODES = {
    "default"   => 0,
    "bold"      => 1,
    "italic"    => 3,
    "underline" => 4,
    "blink"     => 5,
    "reversed"  => 7,
    "hide"      => 9
  }

  {% for color in COLORS.keys %}
    def {{ color.id }}
      colorful({ "foreground" => {{ color }} })
    end

    def on_{{ color.id }}
      colorful({ "background" => {{ color }} })
    end

    {% for mode in MODES.keys %}
      def {{ color.id }}_with_{{ mode.id }}
        colorful({ "foreground" => {{ color }}, "mode" => {{ mode }} })
      end

      def on_{{ color.id }}_with_{{ mode.id }}
        colorful({ "background" => {{ color }}, "mode" => {{ mode }} })
      end
    {% end %}

    {% for highlight in COLORS.keys %}
      def {{color.id}}_on_{{ highlight.id }}
        colorful({ "foreground" => {{ color }}, "background" => {{ highlight }} })
      end

      {% for mode in MODES.keys %}
        def {{color.id}}_on_{{ highlight.id }}_with_{{ mode.id }}
          colorful({ "foreground" => {{ color }}, "background" => {{ highlight }}, "mode" => {{ mode }} })
        end
      {% end %}
    {% end %}
  {% end %}

  {% for mode in MODES.keys %}
    def {{ mode.id }}
      colorful({ "mode" => {{ mode }} })
    end
  {% end %}

  def colorful(options = {} of String => String)
    colored = options.map { |key, value| wand(options, key) }
    colored << self
    colored << mode("default")

    colored.join("")
  end

  private def wand(options, key)
    if key == "mode"
      mode(color_value(options, key))
    else
      color(color_value(options, key), key ==  "background" ? true : false)
    end
  end

  def color(color_name : String|Nil, background : Bool = false)
    return unless color_name && COLORS[color_name]
    "\e[#{COLORS[color_name] + (background ? 10 : 0)}m"
  end

  def colors
    COLORS.keys.sort
  end

  def modes
    MODES.keys.sort
  end

  private def mode(mode_name)
    "\e[#{MODES[mode_name]}m" if MODES[mode_name]
  end

  private def color_value(options, key)
    options.has_key?(key) ? options[key] : nil
  end
end


class String
  include Colorful
end
