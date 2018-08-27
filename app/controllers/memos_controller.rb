class MemosController < ApplicationController
  
  def index
    @memos = Memo.all
  end
  
  def new
    @memo = Memo.new
  end
  
  def create
    @memo = Memo.create(memo_params)
    if @memo.save
      redirect_to memos_path,notice: "メモを作成しました"
    else
      render 'new'
    end
  end
  
  def edit
    @memo = Memo.find(params[:id])
  end
  
  def update
    @memo = Memo.find(params[:id])
    @memo.update(memo_params)
    redirect_to memos_path
  end
  
  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to memos_path
  end
  
  def confirm
    @memo = Memo.new(memo_params)
    render 'new' if @memo.invalid?
  end
  
  private
  def memo_params
    params.require(:memo).permit(:content)
  end
end
