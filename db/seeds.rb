10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
  )
end

puts '10 blog posts created successfully'

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts '5 skills created successfully'

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title #{portfolio_item}",
    subtitle: 'My awesome service',
    body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    main_image: 'https://via.placeholder.com/6000x400',
    thumb_image: 'https://via.placeholder.com/350x200'
  )
end

puts '9 portfolios created successfully'
