DECLARE
  l_todo_user_id  todo_user.id%TYPE;
  l_todo_id       todo.id%TYPE;
  l_category_id       category.id%TYPE;
BEGIN
  -- 1. Data for Luke Skywalker
  INSERT INTO todo_user (name, email)
  VALUES ('Luke Skywalker', 'lastjedi@starwars.io')
  RETURNING id INTO l_todo_user_id;
  
  INSERT INTO todo (title, description, deadline, notifications, user_id)
  VALUES ('The Rise of Skywalker', 'Last time to show off jedi master skills', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, l_todo_user_id)
  RETURNING id INTO l_todo_id;
  
  INSERT INTO category (name, priority, color)
  VALUES ('Jedi Master', 10, 'green')
  RETURNING id INTO l_category_id;
  
  INSERT INTO todo_category (is_planned, category_id, todo_id)
  VALUES ('T', l_category_id, l_todo_id);
  
  INSERT INTO todo_comment (body, user_id, todo_id)
  VALUES ('The force is strong with you', l_todo_user_id, l_todo_id);
  
  INSERT INTO todo (title, description, deadline, notifications, user_id)
  VALUES ('Like father like son', 'I am a Jedi like my father before me', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, l_todo_user_id)
  RETURNING id INTO l_todo_id;
  
  INSERT INTO category (name, priority, color)
  VALUES ('Sith Lord', 2, 'orange')
  RETURNING id INTO l_category_id;
  
  INSERT INTO todo_category (is_planned, category_id, todo_id)
  VALUES ('F', l_category_id, l_todo_id);
  
  INSERT INTO todo_comment (body, user_id, todo_id)
  VALUES ('May the force be with you', l_todo_user_id, l_todo_id);

  -- 1. Data for Darth Vader
  INSERT INTO todo_user (name, email)
  VALUES ('Darth Vade', 'black-attire@starwars.io')
  RETURNING id INTO l_todo_user_id;
  
  INSERT INTO todo (title, description, deadline, notifications, user_id)
  VALUES ('The Empire Strikes Back', 'You underestimate the power of the dark side', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, l_todo_user_id)
  RETURNING id INTO l_todo_id;
  
  INSERT INTO category (name, priority, color)
  VALUES ('Sith Lord', 10, 'red')
  RETURNING id INTO l_category_id;
  
  INSERT INTO todo_category (is_planned, category_id, todo_id)
  VALUES ('T', l_category_id, l_todo_id);
  
  INSERT INTO todo_comment (body, user_id, todo_id)
  VALUES ('Luke I am your father', l_todo_user_id, l_todo_id);
  
  INSERT INTO todo (title, description, deadline, notifications, user_id)
  VALUES ('Reunite with old friend Obi Wan Kenobi', 'Mentoring with Friend', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, l_todo_user_id)
  RETURNING id INTO l_todo_id;
  
  INSERT INTO category (name, priority, color)
  VALUES ('Jedi Master', 5, 'blue')
  RETURNING id INTO l_category_id;
  
  INSERT INTO todo_category (is_planned, category_id, todo_id)
  VALUES ('T', l_category_id, l_todo_id);
  
  INSERT INTO todo_comment (body, user_id, todo_id)
  VALUES ('I must obey my master', l_todo_user_id, l_todo_id);

  COMMIT;
END;
/

