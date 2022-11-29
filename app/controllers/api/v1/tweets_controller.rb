module Api
  module V1
    class TweetsController < ApplicationController
      include MarkdownHelper # 先ほど作成したヘルパー

      # POST /api/v1/articles/preview
      def preview
        content = markdown(params[:text])
        render json: { content: content}
      end
    end
  end
end