class Api::V1::MarkersController < Api::V1::BaseController
    def index
        @markers = @user.markers.all
        respond_to do |format|
            format.json { render :json => @markers.to_json, :status => :ok}
        end
    end

    def create
      data =  request.body.read()
      @marker = @user.markers.new(JSON.parse(data))
        if @marker.save
            render json: @marker, status: :created
        else
            render json: @marker.errors, status: :unprocessable_entity
        end
    end
    

    def update
    end

    def destroy
    end

    def show
    end
    
end
