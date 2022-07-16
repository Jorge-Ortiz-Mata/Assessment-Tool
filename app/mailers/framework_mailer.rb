class FrameworkMailer < ApplicationMailer

    def framework_creation(framework)
        if Rails.env.development?
            @url = "localhost:3000"
        else 
            @url = "https://assessment-tool-point-b-yorch.herokuapp.com/"
        end
        @framework = framework
        mail(to: "jorge.ortiz107@outlook.com", subject: "New Framework: #{framework.name}")
    end

    def framework_update(framework)
        if Rails.env.development?
            @url = "localhost:3000"
        else 
            @url = "https://assessment-tool-point-b-yorch.herokuapp.com/"
        end
        @framework = framework
        mail(to: "jorge.ortiz107@outlook.com", subject: "Update Framework: #{framework.name}")
    end
end
