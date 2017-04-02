module GroupsHelper
  def render_group_description(group)
    simple_format(group.description)
  end

  def render_post_like(post)
    if post.is_like?(current_user)

    else

    end
  end
end
