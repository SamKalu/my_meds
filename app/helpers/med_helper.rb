module MedHelper
   def med_img(med, options = { class: "" })
    if med.photo.attached?
      cl_image_tag med.photo.key, options
    else
      options[:class] += " placeholder"
      image_tag "default_med.png", options
    end
  end
end
