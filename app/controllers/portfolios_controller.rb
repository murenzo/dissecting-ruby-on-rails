class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[edit show update destroy]

  layout 'portfolio'

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

  def edit; end

  def show; end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio created successfully.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio updated successfully.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio destroyed successfully' }
    end
  end

  private

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name])
  end
end
