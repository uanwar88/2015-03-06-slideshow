get "/" do
  slim :index
end

get "/slide/:id" do
  slide = Slide.find(params[:id])
  slide.to_hash.to_json
end

get "/all_slides" do
  all_slides = Slide.fetch_all
  all_slides.to_json
end
