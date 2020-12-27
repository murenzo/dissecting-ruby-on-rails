class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def react
    @react_portfolio_items = Portfolio.react
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body,
                                                                      technologies_attributes: [:name]))
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio created successfully.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body, :main_image,
                                                                  :thumb_image))
        format.html { redirect_to portfolios_path, notice: 'Portfolio updated successfully.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio destroyed successfully' }
    end
  end
end
