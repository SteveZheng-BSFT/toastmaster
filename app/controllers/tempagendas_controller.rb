class TempagendasController < ApplicationController
  def index
    @tempagendas = Tempagenda.paginate(page: params[:page])
  end

  def show
    @tempagenda = Tempagenda.find(params[:id])
  end

  def new
    @tempagenda = Tempagenda.new
  end

  def create
    @tempagenda = Tempagenda.new(tempagenda_params)
    if @tempagenda.save
      flash[:success] = 'agenda saved!'
      redirect_to @tempagenda
    else
      render 'new'
    end
  end

  def edit
    @tempagenda = Tempagenda.find(params[:id])
  end

  private
    def tempagenda_params
      params.require(:tempagenda).permit(:welcomer, :toastmaster, :wordmaster, :timer, :humorist, :speaker1, :speaker2,
                                         :speaker3, :speaker4, :topicmaster, :generaleva, :evaluator1, :evaluator2,
                                         :evaluator3, :evaluator4, :notes, :for_date)
    end
end
