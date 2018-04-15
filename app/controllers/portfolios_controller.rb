class PortfoliosController < ApplicationController
    layout "portfolio"
  
    def index
        @portfolio_items = Portfolio.all
    end
    
    def new 
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end
    
    def angular
      @angular_portfolio_items = Portfolio.angular
    end
    
    
    def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
      end
    end
    end
    
    def edit
      @portfolio_item = Portfolio.find (params[:id])
    end
    
    def update
      @portfolio_item = Portfolio.find (params[:id])
      
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
      end
    end
    end
    
    def show
      @portfolio_item = Portfolio.find (params[:id])
    end
    
    def destroy
      #Perform the lookup
      @portfolio_item = Portfolio.find (params[:id])
      
      #Deletes the record 
    @portfolio_item.destroy
     
     #redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
    end
    
    private
    
    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle,
                                        :body,
                                        technologies_attributes: [:name])
    end
end
