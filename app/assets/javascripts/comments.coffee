# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
 addComment = (data) ->
      $('#comments').append """
        <div class="comment-wrap">
            <div class="photo">
                <%= gravatar_helper comment.user %>
            </div>        
            <div class="comment-block">
                <p class="comment-text">#{data.message}</p>
                <div class="bottom-comment">
                    <ul class="comment-actions">
                        <li class="show"><a href="/comments/#{data.id}">Show</a></li>
                    </ul>
                </div>
            </div>
      </div>
      </div>
      """
      return

    $ ->
      $('#add_comment').on 'ajax:success', (data) ->
        $('#add_comment')[0].reset()
        addComment data.detail[0]
        return
      pusher = new Pusher('<%= ENV["PUSHER_KEY"] %>',
        cluster: '<%= ENV["PUSHER_CLUSTER"] %>'
        encrypted: true)
      channel = pusher.subscribe('comment')
      channel.bind 'new', (data) ->
          addComment data
          return
      return
    return
