class GitCleanup
  module Helper
    @@prompt = true

    def self.prompt=(val)
        @@prompt = val
    end

    def self.boolean(question, &block)
      unless @@prompt:
        yield
        return true
      end
      Formatador.display_line ""
      Formatador.display("[bold][blue][QUESTION][/] #{question} (y/n)[/] ")
      answer = STDIN.gets.chomp
      if answer == 'y'
        yield
      elsif answer == 'n'
        return false
      else
        boolean(question, &block)
      end
    end
    
    def self.info(info)
      Formatador.display_line "[bold][yellow][INFO][/] #{info}[/]"
    end
  end
end