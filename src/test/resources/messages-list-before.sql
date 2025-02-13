delete from messages;

INSERT INTO messages(id, text, tag, user_id)
VALUES (1, 'first', 'my-tag', 1),
       (2, 'second', 'more', 1),
       (3, 'third', 'my-tag', 1),
       (4, 'fourth', 'another', 1);

ALTER TABLE messages AUTO_INCREMENT = 10;