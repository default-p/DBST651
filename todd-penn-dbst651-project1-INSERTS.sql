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

  -- 2. Data for Darth Vader
  INSERT INTO todo_user (name, email)
  VALUES ('Darth Vader', 'black-attire@starwars.io')
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

  -- 3. Data for Princess Leia
  INSERT INTO todo_user (name, email)
  VALUES ('General Leia', 'princess@starwars.io')
  RETURNING id INTO l_todo_user_id;
  
  INSERT INTO todo (title, description, deadline, notifications, user_id)
  VALUES ('Return of the Jedi', 'I feel very passionate about Luke', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, l_todo_user_id)
  RETURNING id INTO l_todo_id;
  
  INSERT INTO category (name, priority, color)
  VALUES ('Jedi Apprentice', 10, 'green')
  RETURNING id INTO l_category_id;
  
  INSERT INTO todo_category (is_planned, category_id, todo_id)
  VALUES ('T', l_category_id, l_todo_id);
  
  INSERT INTO todo_comment (body, user_id, todo_id)
  VALUES ('My father was seduced by the dark side', l_todo_user_id, l_todo_id);
  
  INSERT INTO todo (title, description, deadline, notifications, user_id)
  VALUES ('Someone has to save our skins', 'Punishing Han Solo', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, l_todo_user_id)
  RETURNING id INTO l_todo_id;
  
  INSERT INTO category (name, priority, color)
  VALUES ('Jedi Master', 3, 'blue')
  RETURNING id INTO l_category_id;
  
  INSERT INTO todo_category (is_planned, category_id, todo_id)
  VALUES ('F', l_category_id, l_todo_id);
  
  INSERT INTO todo_comment (body, user_id, todo_id)
  VALUES ('Punish Kylo Ren', l_todo_user_id, l_todo_id);

  -- 4. Data for Han Solo
  INSERT INTO todo_user (name, email)
  VALUES ('Han Solo', 'i-heart-me-falcon@starwars.io')
  RETURNING id INTO l_todo_user_id;
  
  INSERT INTO todo (title, description, deadline, notifications, user_id)
  VALUES ('A New Hope', 'I think Leia likes me', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, l_todo_user_id)
  RETURNING id INTO l_todo_id;
  
  INSERT INTO category (name, priority, color)
  VALUES ('Rebel Alliance', 10, 'blue')
  RETURNING id INTO l_category_id;
  
  INSERT INTO todo_category (is_planned, category_id, todo_id)
  VALUES ('T', l_category_id, l_todo_id);
  
  INSERT INTO todo_comment (body, user_id, todo_id)
  VALUES ('When did I have a son', l_todo_user_id, l_todo_id);
  
  INSERT INTO todo (title, description, deadline, notifications, user_id)
  VALUES ('Dont everybody thank me at once', 'sometimes I amaze even myself', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, l_todo_user_id)
  RETURNING id INTO l_todo_id;
  
  INSERT INTO category (name, priority, color)
  VALUES ('Jedi Master', 7, 'green')
  RETURNING id INTO l_category_id;
  
  INSERT INTO todo_category (is_planned, category_id, todo_id)
  VALUES ('F', l_category_id, l_todo_id);
  
  INSERT INTO todo_comment (body, user_id, todo_id)
  VALUES ('Payback Lando', l_todo_user_id, l_todo_id);

  -- 4. Data for Darth Sidious
  INSERT INTO todo_user (name, email)
  VALUES ('Darth Sidious', 'evilsenator@starwars.io')
  RETURNING id INTO l_todo_user_id;
  
  INSERT INTO todo (title, description, deadline, notifications, user_id)
  VALUES ('Revenge of the Sith', 'Unlimited Power', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, l_todo_user_id)
  RETURNING id INTO l_todo_id;
  
  INSERT INTO category (name, priority, color)
  VALUES ('Sith Lord', 10, 'black')
  RETURNING id INTO l_category_id;
  
  INSERT INTO todo_category (is_planned, category_id, todo_id)
  VALUES ('T', l_category_id, l_todo_id);
  
  INSERT INTO todo_comment (body, user_id, todo_id)
  VALUES ('the Sith will rule the galaxy and we shall have peace', l_todo_user_id, l_todo_id);
  
  -- 5. Data for Yoda
  INSERT INTO todo_user (name, email)
  VALUES ('Master Yoda', 'green-guys-need-love-2@starwars.io')
  RETURNING id INTO l_todo_user_id;
  
  INSERT INTO todo (title, description, deadline, notifications, user_id)
  VALUES ('Do or do not - there is no try', 'that is why you fail', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, l_todo_user_id)
  RETURNING id INTO l_todo_id;
  
  INSERT INTO category (name, priority, color)
  VALUES ('Jedi Master', 10, 'green')
  RETURNING id INTO l_category_id;
  
  INSERT INTO todo_category (is_planned, category_id, todo_id)
  VALUES ('T', l_category_id, l_todo_id);
  
  INSERT INTO todo_comment (body, user_id, todo_id)
  VALUES ('patience you must have, my young padawan', l_todo_user_id, l_todo_id);
  
  -- 6. Data for Batch Users
  INSERT INTO todo_user (name, email)
  VALUES ('Chewbacca', 'no-i-dont-know-bigfoot@starwars.io');

  INSERT INTO todo_user (name, email)
  VALUES ('R2D2', 'beep-boop-beep@starwars.io');
  
  INSERT INTO todo_user (name, email)
  VALUES ('C-3PO', 'thisismadness@starwars.io');

  INSERT INTO todo_user (name, email)
  VALUES ('Boba Fett', 'mandalorian@starwars.io');  

  COMMIT;
END;
/

