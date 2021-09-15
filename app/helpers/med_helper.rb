module MedHelper
  def med_img(med, options = { class: "" })
    if med.photo.attached?
      cl_image_tag med.photo.key, options
    else
      options[:class] += " placeholder"
      image_tag "https://pixabay.com/get/gdd499c7de7458c0c10fa24949efe9ee2d344325373be6922e5d49eac51d1d846c89222001945e7247c29c2bd1ad3e545_640.jpg",
                options
    end
  end
end
