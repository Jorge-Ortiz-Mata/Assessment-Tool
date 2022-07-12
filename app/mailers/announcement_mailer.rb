class AnnouncementMailer < ApplicationMailer
    default from: "jorge.ortiz@icalialabs.com"

    def template(template)
        @template = template
        @email_to = "ortiz.mata.jorge@gmail.com"
        if Rails.env.production?
            @url = "https://assessment-tool-point-b-yorch.herokuapp.com/"
        else
            @url = "http://localhost:3000/"
        end
        mail(to: @email_to, subject: 'New Template')
    end
end
