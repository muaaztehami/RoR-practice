module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :text, :tag_list)
  end
end
