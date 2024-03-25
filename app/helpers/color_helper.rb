module ColorHelper
    def main_color
      @main_color ||= set_main_color
    end
  
    private
  
    def set_main_color
        '#004D2B'
    end
  end