/*
  Warnings:

  - The primary key for the `ad_accounts` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `ad_accounts` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `ad_metrics` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `ad_metrics` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `ad_set_metrics` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `ad_set_metrics` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `ad_sets` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `ad_sets` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `metaAccountId` column on the `ad_sets` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `ads` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `ads` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `metaAccountId` column on the `ads` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `ads_planners` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `ads_planners` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `campaign_metrics` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `campaign_metrics` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `campaigns` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `campaigns` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `metaAccountId` column on the `campaigns` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `adAccountId` column on the `campaigns` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `clinicId` column on the `campaigns` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `productId` column on the `campaigns` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `clinics` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `clinics` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `conversion_metrics` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `conversion_metrics` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `engagement_metrics` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `engagement_metrics` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `incomes` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `incomes` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `influencer_campaigns` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `influencer_campaigns` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `influencers` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `influencers` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `invoices` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `invoices` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `meta_accounts` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `meta_accounts` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `notifications` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `notifications` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `payments` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `payments` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `invoiceId` column on the `payments` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `planner_items` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `planner_items` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `platform_metrics` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `platform_metrics` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `products` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `products` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `roas_metrics` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `roas_metrics` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `schedules` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `schedules` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `adId` column on the `schedules` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `clinicId` column on the `schedules` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `productId` column on the `schedules` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `settings` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `settings` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `social_media_accounts` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `social_media_accounts` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `tags` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `tags` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `tags_on_campaigns` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `refreshToken` on the `users` table. All the data in the column will be lost.
  - The `id` column on the `users` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `metaAccountId` on the `ad_accounts` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `adId` on the `ad_metrics` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `adSetId` on the `ad_set_metrics` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `ad_sets` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `campaignId` on the `ad_sets` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `ads` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `adSetId` on the `ads` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `campaignId` on the `campaign_metrics` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `campaigns` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `clinics` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `accountId` on the `engagement_metrics` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `influencerId` on the `influencer_campaigns` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `influencers` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `accountId` on the `influencers` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `invoices` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `meta_accounts` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `notifications` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `payments` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `plannerId` on the `planner_items` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `accountId` on the `platform_metrics` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `products` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `schedules` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `userId` on the `social_media_accounts` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `tagId` on the `tags_on_campaigns` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `campaignId` on the `tags_on_campaigns` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Made the column `name` on table `users` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "ad_accounts" DROP CONSTRAINT "ad_accounts_metaAccountId_fkey";

-- DropForeignKey
ALTER TABLE "ad_metrics" DROP CONSTRAINT "ad_metrics_adId_fkey";

-- DropForeignKey
ALTER TABLE "ad_set_metrics" DROP CONSTRAINT "ad_set_metrics_adSetId_fkey";

-- DropForeignKey
ALTER TABLE "ad_sets" DROP CONSTRAINT "ad_sets_campaignId_fkey";

-- DropForeignKey
ALTER TABLE "ad_sets" DROP CONSTRAINT "ad_sets_metaAccountId_fkey";

-- DropForeignKey
ALTER TABLE "ad_sets" DROP CONSTRAINT "ad_sets_userId_fkey";

-- DropForeignKey
ALTER TABLE "ads" DROP CONSTRAINT "ads_adSetId_fkey";

-- DropForeignKey
ALTER TABLE "ads" DROP CONSTRAINT "ads_metaAccountId_fkey";

-- DropForeignKey
ALTER TABLE "ads" DROP CONSTRAINT "ads_userId_fkey";

-- DropForeignKey
ALTER TABLE "campaign_metrics" DROP CONSTRAINT "campaign_metrics_campaignId_fkey";

-- DropForeignKey
ALTER TABLE "campaigns" DROP CONSTRAINT "campaigns_adAccountId_fkey";

-- DropForeignKey
ALTER TABLE "campaigns" DROP CONSTRAINT "campaigns_clinicId_fkey";

-- DropForeignKey
ALTER TABLE "campaigns" DROP CONSTRAINT "campaigns_metaAccountId_fkey";

-- DropForeignKey
ALTER TABLE "campaigns" DROP CONSTRAINT "campaigns_productId_fkey";

-- DropForeignKey
ALTER TABLE "campaigns" DROP CONSTRAINT "campaigns_userId_fkey";

-- DropForeignKey
ALTER TABLE "clinics" DROP CONSTRAINT "clinics_userId_fkey";

-- DropForeignKey
ALTER TABLE "engagement_metrics" DROP CONSTRAINT "engagement_metrics_accountId_fkey";

-- DropForeignKey
ALTER TABLE "influencer_campaigns" DROP CONSTRAINT "influencer_campaigns_influencerId_fkey";

-- DropForeignKey
ALTER TABLE "influencers" DROP CONSTRAINT "influencers_accountId_fkey";

-- DropForeignKey
ALTER TABLE "influencers" DROP CONSTRAINT "influencers_userId_fkey";

-- DropForeignKey
ALTER TABLE "invoices" DROP CONSTRAINT "invoices_userId_fkey";

-- DropForeignKey
ALTER TABLE "meta_accounts" DROP CONSTRAINT "meta_accounts_userId_fkey";

-- DropForeignKey
ALTER TABLE "notifications" DROP CONSTRAINT "notifications_userId_fkey";

-- DropForeignKey
ALTER TABLE "payments" DROP CONSTRAINT "payments_invoiceId_fkey";

-- DropForeignKey
ALTER TABLE "payments" DROP CONSTRAINT "payments_userId_fkey";

-- DropForeignKey
ALTER TABLE "planner_items" DROP CONSTRAINT "planner_items_plannerId_fkey";

-- DropForeignKey
ALTER TABLE "platform_metrics" DROP CONSTRAINT "platform_metrics_accountId_fkey";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_userId_fkey";

-- DropForeignKey
ALTER TABLE "schedules" DROP CONSTRAINT "schedules_adId_fkey";

-- DropForeignKey
ALTER TABLE "schedules" DROP CONSTRAINT "schedules_clinicId_fkey";

-- DropForeignKey
ALTER TABLE "schedules" DROP CONSTRAINT "schedules_productId_fkey";

-- DropForeignKey
ALTER TABLE "schedules" DROP CONSTRAINT "schedules_userId_fkey";

-- DropForeignKey
ALTER TABLE "social_media_accounts" DROP CONSTRAINT "social_media_accounts_userId_fkey";

-- DropForeignKey
ALTER TABLE "tags_on_campaigns" DROP CONSTRAINT "tags_on_campaigns_campaignId_fkey";

-- DropForeignKey
ALTER TABLE "tags_on_campaigns" DROP CONSTRAINT "tags_on_campaigns_tagId_fkey";

-- AlterTable
ALTER TABLE "ad_accounts" DROP CONSTRAINT "ad_accounts_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "metaAccountId",
ADD COLUMN     "metaAccountId" INTEGER NOT NULL,
ADD CONSTRAINT "ad_accounts_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "ad_metrics" DROP CONSTRAINT "ad_metrics_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "adId",
ADD COLUMN     "adId" INTEGER NOT NULL,
ADD CONSTRAINT "ad_metrics_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "ad_set_metrics" DROP CONSTRAINT "ad_set_metrics_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "adSetId",
ADD COLUMN     "adSetId" INTEGER NOT NULL,
ADD CONSTRAINT "ad_set_metrics_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "ad_sets" DROP CONSTRAINT "ad_sets_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
DROP COLUMN "campaignId",
ADD COLUMN     "campaignId" INTEGER NOT NULL,
DROP COLUMN "metaAccountId",
ADD COLUMN     "metaAccountId" INTEGER,
ADD CONSTRAINT "ad_sets_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "ads" DROP CONSTRAINT "ads_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
DROP COLUMN "adSetId",
ADD COLUMN     "adSetId" INTEGER NOT NULL,
DROP COLUMN "metaAccountId",
ADD COLUMN     "metaAccountId" INTEGER,
ADD CONSTRAINT "ads_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "ads_planners" DROP CONSTRAINT "ads_planners_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "ads_planners_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "campaign_metrics" DROP CONSTRAINT "campaign_metrics_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "campaignId",
ADD COLUMN     "campaignId" INTEGER NOT NULL,
ADD CONSTRAINT "campaign_metrics_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "campaigns" DROP CONSTRAINT "campaigns_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
DROP COLUMN "metaAccountId",
ADD COLUMN     "metaAccountId" INTEGER,
DROP COLUMN "adAccountId",
ADD COLUMN     "adAccountId" INTEGER,
DROP COLUMN "clinicId",
ADD COLUMN     "clinicId" INTEGER,
DROP COLUMN "productId",
ADD COLUMN     "productId" INTEGER,
ADD CONSTRAINT "campaigns_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "clinics" DROP CONSTRAINT "clinics_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "clinics_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "conversion_metrics" DROP CONSTRAINT "conversion_metrics_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "conversion_metrics_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "engagement_metrics" DROP CONSTRAINT "engagement_metrics_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "accountId",
ADD COLUMN     "accountId" INTEGER NOT NULL,
ADD CONSTRAINT "engagement_metrics_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "incomes" DROP CONSTRAINT "incomes_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "incomes_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "influencer_campaigns" DROP CONSTRAINT "influencer_campaigns_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "influencerId",
ADD COLUMN     "influencerId" INTEGER NOT NULL,
ADD CONSTRAINT "influencer_campaigns_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "influencers" DROP CONSTRAINT "influencers_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
DROP COLUMN "accountId",
ADD COLUMN     "accountId" INTEGER NOT NULL,
ADD CONSTRAINT "influencers_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "invoices" DROP CONSTRAINT "invoices_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "invoices_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "meta_accounts" DROP CONSTRAINT "meta_accounts_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "meta_accounts_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "notifications" DROP CONSTRAINT "notifications_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "notifications_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "payments" DROP CONSTRAINT "payments_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
DROP COLUMN "invoiceId",
ADD COLUMN     "invoiceId" INTEGER,
ADD CONSTRAINT "payments_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "planner_items" DROP CONSTRAINT "planner_items_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "plannerId",
ADD COLUMN     "plannerId" INTEGER NOT NULL,
ADD CONSTRAINT "planner_items_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "platform_metrics" DROP CONSTRAINT "platform_metrics_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "accountId",
ADD COLUMN     "accountId" INTEGER NOT NULL,
ADD CONSTRAINT "platform_metrics_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "products" DROP CONSTRAINT "products_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "roas_metrics" DROP CONSTRAINT "roas_metrics_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "roas_metrics_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "schedules" DROP CONSTRAINT "schedules_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
DROP COLUMN "adId",
ADD COLUMN     "adId" INTEGER,
DROP COLUMN "clinicId",
ADD COLUMN     "clinicId" INTEGER,
DROP COLUMN "productId",
ADD COLUMN     "productId" INTEGER,
ADD CONSTRAINT "schedules_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "settings" DROP CONSTRAINT "settings_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "settings_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "social_media_accounts" DROP CONSTRAINT "social_media_accounts_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "social_media_accounts_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "tags" DROP CONSTRAINT "tags_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "tags_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "tags_on_campaigns" DROP CONSTRAINT "tags_on_campaigns_pkey",
DROP COLUMN "tagId",
ADD COLUMN     "tagId" INTEGER NOT NULL,
DROP COLUMN "campaignId",
ADD COLUMN     "campaignId" INTEGER NOT NULL,
ADD CONSTRAINT "tags_on_campaigns_pkey" PRIMARY KEY ("tagId", "campaignId");

-- AlterTable
ALTER TABLE "users" DROP CONSTRAINT "users_pkey",
DROP COLUMN "refreshToken",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ALTER COLUMN "name" SET NOT NULL,
ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "ad_metrics_adId_date_key" ON "ad_metrics"("adId", "date");

-- CreateIndex
CREATE UNIQUE INDEX "ad_set_metrics_adSetId_date_key" ON "ad_set_metrics"("adSetId", "date");

-- CreateIndex
CREATE UNIQUE INDEX "campaign_metrics_campaignId_date_key" ON "campaign_metrics"("campaignId", "date");

-- CreateIndex
CREATE UNIQUE INDEX "engagement_metrics_accountId_date_key" ON "engagement_metrics"("accountId", "date");

-- CreateIndex
CREATE UNIQUE INDEX "platform_metrics_accountId_date_key" ON "platform_metrics"("accountId", "date");

-- CreateIndex
CREATE UNIQUE INDEX "social_media_accounts_userId_platform_accountName_key" ON "social_media_accounts"("userId", "platform", "accountName");

-- AddForeignKey
ALTER TABLE "meta_accounts" ADD CONSTRAINT "meta_accounts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ad_accounts" ADD CONSTRAINT "ad_accounts_metaAccountId_fkey" FOREIGN KEY ("metaAccountId") REFERENCES "meta_accounts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campaigns" ADD CONSTRAINT "campaigns_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campaigns" ADD CONSTRAINT "campaigns_metaAccountId_fkey" FOREIGN KEY ("metaAccountId") REFERENCES "meta_accounts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campaigns" ADD CONSTRAINT "campaigns_adAccountId_fkey" FOREIGN KEY ("adAccountId") REFERENCES "ad_accounts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campaigns" ADD CONSTRAINT "campaigns_clinicId_fkey" FOREIGN KEY ("clinicId") REFERENCES "clinics"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campaigns" ADD CONSTRAINT "campaigns_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "campaign_metrics" ADD CONSTRAINT "campaign_metrics_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES "campaigns"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ad_sets" ADD CONSTRAINT "ad_sets_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ad_sets" ADD CONSTRAINT "ad_sets_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES "campaigns"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ad_sets" ADD CONSTRAINT "ad_sets_metaAccountId_fkey" FOREIGN KEY ("metaAccountId") REFERENCES "meta_accounts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ad_set_metrics" ADD CONSTRAINT "ad_set_metrics_adSetId_fkey" FOREIGN KEY ("adSetId") REFERENCES "ad_sets"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ads" ADD CONSTRAINT "ads_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ads" ADD CONSTRAINT "ads_adSetId_fkey" FOREIGN KEY ("adSetId") REFERENCES "ad_sets"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ads" ADD CONSTRAINT "ads_metaAccountId_fkey" FOREIGN KEY ("metaAccountId") REFERENCES "meta_accounts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ad_metrics" ADD CONSTRAINT "ad_metrics_adId_fkey" FOREIGN KEY ("adId") REFERENCES "ads"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schedules" ADD CONSTRAINT "schedules_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schedules" ADD CONSTRAINT "schedules_adId_fkey" FOREIGN KEY ("adId") REFERENCES "ads"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schedules" ADD CONSTRAINT "schedules_clinicId_fkey" FOREIGN KEY ("clinicId") REFERENCES "clinics"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schedules" ADD CONSTRAINT "schedules_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "planner_items" ADD CONSTRAINT "planner_items_plannerId_fkey" FOREIGN KEY ("plannerId") REFERENCES "ads_planners"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "social_media_accounts" ADD CONSTRAINT "social_media_accounts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "platform_metrics" ADD CONSTRAINT "platform_metrics_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "social_media_accounts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "engagement_metrics" ADD CONSTRAINT "engagement_metrics_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "social_media_accounts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "influencers" ADD CONSTRAINT "influencers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "influencers" ADD CONSTRAINT "influencers_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "social_media_accounts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "influencer_campaigns" ADD CONSTRAINT "influencer_campaigns_influencerId_fkey" FOREIGN KEY ("influencerId") REFERENCES "influencers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "clinics" ADD CONSTRAINT "clinics_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payments" ADD CONSTRAINT "payments_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payments" ADD CONSTRAINT "payments_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "invoices"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "invoices" ADD CONSTRAINT "invoices_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tags_on_campaigns" ADD CONSTRAINT "tags_on_campaigns_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "tags"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tags_on_campaigns" ADD CONSTRAINT "tags_on_campaigns_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES "campaigns"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
