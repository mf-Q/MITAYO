class ProductsController < ApplicationController

  def index
    @products = Product.all.order("id")
    @product = @products.each do |product|
    @product_user_id = product.user_id
    end
    @q = Product.ransack(params[:q])
    @search = @q.result(distinct: true)
  end

  def new
     @product = Product.new
  end

  def create
    @product = Product.new(title: product_params[:title],
                           genre: product_params[:genre],
                           timing: product_params['timing(1i)'] + "/" + product_params['timing(2i)'] + "/" + product_params['timing(3i)'],
                           place: product_params[:place],
                           number: product_params[:number],
                           content: product_params[:content],
                           user_id: current_user.id
                          )
    if @product.save
    redirect_to root_path, notice: '1 MITAYO 追加！'
    else
      flash.now[:alert] = '追加に失敗したよ'
      render :new
    end
  end
  

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path, notice: '1 MITAYO 編集！'
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path, alert: '1 MITAYO 削除！'
  end

  private
  def product_params
    params.require(:product).permit(:title,
                                    :genre,
                                    :timing,
                                    'timing(1i)',
                                    'timing(2i)',
                                    'timing(3i)',
                                    :place,
                                    :number,
                                    :content).merge(user_id: current_user.id)
  end
end
