-- CreateTable
CREATE TABLE `ElasticMappingLog` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `file_name` VARCHAR(255) NOT NULL,
    `index_type` VARCHAR(255) NOT NULL,
    `index_id` VARCHAR(255) NULL,
    `mapping_implemented_at` DATETIME(3) NOT NULL,
    `index_implemented_at` DATETIME(3) NULL,

    UNIQUE INDEX `ElasticMappingLog_file_name_key`(`file_name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Image` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `order_number` INTEGER NULL DEFAULT 0,
    `url` VARCHAR(191) NULL,
    `blur_base64` VARCHAR(191) NULL,
    `fileName` VARCHAR(191) NULL,
    `caption` VARCHAR(255) NULL,
    `origin` VARCHAR(255) NOT NULL,
    `isProfileImage` BOOLEAN NOT NULL,
    `published` BOOLEAN NOT NULL DEFAULT true,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `user_id` VARCHAR(255) NOT NULL,
    `location_id` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Location` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `location_id` VARCHAR(255) NOT NULL,
    `place_name` VARCHAR(255) NOT NULL,
    `place_type` VARCHAR(255) NOT NULL,
    `coordinates` VARCHAR(255) NOT NULL,
    `text` VARCHAR(255) NOT NULL,
    `region_id` VARCHAR(255) NULL,
    `region_text` VARCHAR(255) NULL,
    `country_id` VARCHAR(255) NULL,
    `country_text` VARCHAR(255) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `user_id` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Review` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `text` VARCHAR(4000) NOT NULL,
    `rating` INTEGER NOT NULL,
    `published` BOOLEAN NOT NULL DEFAULT true,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `user_id` VARCHAR(255) NOT NULL,
    `author_id` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ReviewResponse` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(4000) NOT NULL,
    `published` BOOLEAN NOT NULL DEFAULT true,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `author_id` VARCHAR(255) NOT NULL,
    `review_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sport` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `level` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `user_id` VARCHAR(255) NOT NULL,
    `sport_type_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SportType` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tag` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(4000) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TagUser` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `user_id` VARCHAR(255) NOT NULL,
    `tag_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `blacklisted` BOOLEAN NOT NULL DEFAULT false,
    `is_guide` BOOLEAN NOT NULL,
    `average_rating` DOUBLE NULL DEFAULT 0,
    `number_rating` INTEGER NULL DEFAULT 0,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `user_username_unique`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserReviewMeta` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `average_rating` DOUBLE NOT NULL DEFAULT 0,
    `number_rating` INTEGER NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `user_id` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `UserReviewMeta_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Vita` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(200) NOT NULL,
    `text` VARCHAR(4000) NOT NULL,
    `from_date` DATE NOT NULL,
    `to_date` DATE NOT NULL,
    `is_current` BOOLEAN NOT NULL DEFAULT true,
    `is_published` BOOLEAN NOT NULL DEFAULT true,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `user_id` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
