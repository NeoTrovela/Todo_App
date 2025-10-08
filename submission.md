# Todo App Submission

## 1. Add a new attribute to the Todo model

Add a new boolean field called `done` with a default value of `false` to display and edit in the views.

### Generate Migration

```bash
rails generate migration AddDoneToTodo done:boolean
```

Output:
```
invoke  active_record
create    db/migrate/20251007151625_add_done_to_todo.rb
```

### Run Migration

```bash
rails db:migrate
```

Output:
```
== 20251007151625 AddDoneToTodo: migrating ====================================
-- add_column(:todos, :done, :boolean)
   -> 0.0019s
== 20251007151625 AddDoneToTodo: migrated (0.0020s) ===========================
```

### Update Controller

Update `todos_controller.rb` to include the `done` attribute:

```ruby
def todo_params
  params.require(:todo).permit(:description, :due_date, :done) # <- added :done
end
```

### Update Views

Update `_form.html.erb`:

```erb
<div>
  <%= form.label :done, style: "display: block" %>
  <%= form.check_box :done %>
</div>
```

Update `_todo.html.erb`:

```erb
<p>
  <strong>Done:</strong>
  <%= todo.done %>
</p>
```

---

## 2. Change the routing schema

Create a new route `new_todo` to go to a page that creates a new Todo item.

### Route Already Exists

The route `new_todo` already exists and goes to the new Todo page:

```
new_todo GET /todos/new(.:format) todos#new
```

---

## 3. Set todos#index as the homepage

### Update Routes

In `config/routes.rb`, set `todos#index` as the root:

```ruby
root "todos#index"
```

---

## Files Changed

- `/app/controllers/todos_controller.rb`
- `/app/views/todos/_form.html.erb`
- `/app/views/todos/_todo.html.erb`
- `/config/routes.rb`
- `/db/schema.rb`
- `/db/migrate/20251007151625_add_done_to_todo.rb`

---

## Heroku Deployment

### Database Migrations

```bash
heroku run rails db:migrate
heroku run rails db:seed
```

### Testing

```bash
heroku open
```

### Live App URL

[https://neotrovelavillamiel-todo-0c6c54d0d045.herokuapp.com/](https://neotrovelavillamiel-todo-0c6c54d0d045.herokuapp.com/)
