-- Create Table with Range Pertition
  
CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
PARTITION BY RANGE (`id`)
(
  PARTITION p_one VALUES LESS THAN (3) ENGINE = InnoDB, -- Supports id = 1, 2
  PARTITION p_two VALUES LESS THAN (5) ENGINE = InnoDB, -- Supports id = 3, 4
  PARTITION p_three VALUES LESS THAN MAXVALUE ENGINE = InnoDB -- Supports id = 5 - MAX
);

-- ADD More Partition
ALTER TABLE users ADD PARTITION (
    PARTITION p_ VALUES LESS THAN (MAXVALUE)
);

-- Data backup in new table
CREATE TABLE users_backup AS SELECT * FROM users;

-- Data Restore backup table to main table
INSERT INTO users SELECT * FROM users_backup;

-- Change table Engine - InnoDB, MyISAM etc.
ALTER TABLE users ENGINE=InnoDB;
