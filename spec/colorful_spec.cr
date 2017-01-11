require "./spec_helper"

describe Colorful do

  context "#foreground" do
    it "should be red" do
      "\e[31mred\e[0m".should eq "red".red
    end

    it "should be blue" do
      "\e[31m\e[34mblue\e[0m\e[0m".should eq "blue".blue.red
    end
  end

  context "#background" do
    it "should be yellow" do
      "\e[43myellow\e[0m".should eq "yellow".on_yellow
    end
  end

  context "#foreground_on_background" do
    it "should be black_on_white" do
      "\e[30m\e[47mblack_on_white\e[0m".should eq "black_on_white".black_on_white
    end
  end

  context "#foreground_with_mode" do
    it "should be yellow_with_bold" do
      "\e[33m\e[1myellow_with_bold\e[0m".should eq "yellow_with_bold".yellow_with_bold
    end
  end

  context "#on_background_with_mode" do
    it "should be on_magenta_with_italic" do
      "\e[45m\e[3mon_magenta_with_italic\e[0m".should eq "on_magenta_with_italic".on_magenta_with_italic
    end
  end

  context "#foreground_on_background_with_mode" do
    it "should be red_on_cyan_with_italic" do
      "\e[31m\e[46m\e[3mred_on_cyan_with_italic\e[0m".should eq "red_on_cyan_with_italic".red_on_cyan_with_italic
    end
  end

  context "#color.#mode" do
    it "should be yellow_with_bold" do
      "\e[1m\e[33myellow.bold\e[0m\e[0m".should eq "yellow.bold".yellow.bold
    end

    it "should be on_magenta_with_italic" do
      "\e[3m\e[45mon_magenta.italic\e[0m\e[0m".should eq "on_magenta.italic".on_magenta.italic
    end
  end

  context "#colorful" do
    it "should be colorful" do
      "\e[31m\e[46m\e[3mred_on_cyan_with_italic\e[0m".should eq "red_on_cyan_with_italic".colorful({ "foreground" => "red", "background" => "cyan", "mode" => "italic" })
    end
  end

  it "should dump colors" do
    Colorful.colors.should eq ["black", "blue", "cyan", "green", "magenta", "red", "white", "yellow"]
  end

  it "should dump modes" do
    Colorful.modes.should eq ["blink", "bold", "default", "hide", "italic", "reversed", "underline"]
  end
end
