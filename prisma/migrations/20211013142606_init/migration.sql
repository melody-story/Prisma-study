/*
  Warnings:

  - You are about to alter the column `title` on the `Script` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `remarks` on the `Script` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(1000)`.
  - You are about to alter the column `url` on the `Script` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(500)`.
  - You are about to alter the column `downloadCount` on the `ScriptStatus` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Integer`.
  - You are about to drop the column `sentanceId` on the `SentenceRequirement` table. All the data in the column will be lost.
  - You are about to drop the column `voiceId` on the `SentenceRequirement` table. All the data in the column will be lost.
  - You are about to alter the column `language` on the `SentenceRequirement` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to alter the column `gender` on the `SentenceRequirement` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to drop the column `description` on the `Voice` table. All the data in the column will be lost.
  - You are about to drop the column `fileSize` on the `Voice` table. All the data in the column will be lost.
  - You are about to alter the column `url` on the `Voice` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(500)`.
  - You are about to alter the column `downloadCount` on the `VoiceStatus` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Integer`.
  - You are about to alter the column `verify` on the `VoiceStatus` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - You are about to drop the `Sentence` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[title]` on the table `Script` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[scriptId]` on the table `ScriptStatus` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[sentenceId]` on the table `SentenceRequirement` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[sentanceRequirementId]` on the table `SentenceStatus` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[sentenceRequirementId]` on the table `Voice` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[voiceId]` on the table `VoiceStatus` will be added. If there are existing duplicate values, this will fail.
  - Changed the type of `file_size` on the `Script` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `sentenceId` to the `SentenceRequirement` table without a default value. This is not possible if the table is not empty.
  - Added the required column `file_size` to the `Voice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sentenceRequirementId` to the `Voice` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Script" ALTER COLUMN "title" SET DATA TYPE VARCHAR(50),
DROP COLUMN "file_size",
ADD COLUMN     "file_size" BYTEA NOT NULL,
ALTER COLUMN "remarks" SET DATA TYPE VARCHAR(1000),
ALTER COLUMN "clientId" DROP NOT NULL,
ALTER COLUMN "url" SET DATA TYPE VARCHAR(500),
ALTER COLUMN "dateOfCreated" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "dateOfCreated" SET DATA TYPE TIMESTAMPTZ(3),
ALTER COLUMN "dateOfUpdated" DROP NOT NULL,
ALTER COLUMN "dateOfUpdated" SET DATA TYPE TIMESTAMPTZ(3);

-- AlterTable
ALTER TABLE "ScriptStatus" ALTER COLUMN "post" SET DEFAULT false,
ALTER COLUMN "deadline" SET DEFAULT false,
ALTER COLUMN "downloadCount" SET DEFAULT 0,
ALTER COLUMN "downloadCount" SET DATA TYPE INTEGER,
ALTER COLUMN "clientId" DROP NOT NULL,
ALTER COLUMN "dateOfCreated" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "dateOfCreated" SET DATA TYPE TIMESTAMPTZ(3),
ALTER COLUMN "dateOfUpdated" DROP NOT NULL,
ALTER COLUMN "dateOfUpdated" SET DATA TYPE TIMESTAMPTZ(3);

-- AlterTable
ALTER TABLE "SentenceRequirement" DROP COLUMN "sentanceId",
DROP COLUMN "voiceId",
ADD COLUMN     "sentenceId" INTEGER NOT NULL,
ALTER COLUMN "language" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "age" DROP NOT NULL,
ALTER COLUMN "gender" DROP NOT NULL,
ALTER COLUMN "gender" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "dateOfCreated" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "dateOfCreated" SET DATA TYPE TIMESTAMPTZ(3),
ALTER COLUMN "dateOfUpdated" DROP NOT NULL,
ALTER COLUMN "dateOfUpdated" SET DATA TYPE TIMESTAMPTZ(3);

-- AlterTable
ALTER TABLE "SentenceStatus" ALTER COLUMN "deadlineStatus" SET DEFAULT false,
ALTER COLUMN "dateOfCreated" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "dateOfCreated" SET DATA TYPE TIMESTAMPTZ(3),
ALTER COLUMN "dateOfUpdated" DROP NOT NULL,
ALTER COLUMN "dateOfUpdated" SET DATA TYPE TIMESTAMPTZ(3);

-- AlterTable
ALTER TABLE "Voice" DROP COLUMN "description",
DROP COLUMN "fileSize",
ADD COLUMN     "file_size" BYTEA NOT NULL,
ADD COLUMN     "sentenceRequirementId" INTEGER NOT NULL,
ALTER COLUMN "url" SET DATA TYPE VARCHAR(500),
ALTER COLUMN "dateOfCreated" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "dateOfCreated" SET DATA TYPE TIMESTAMPTZ(3),
ALTER COLUMN "dateOfUpdated" DROP NOT NULL,
ALTER COLUMN "dateOfUpdated" SET DATA TYPE TIMESTAMPTZ(3);

-- AlterTable
ALTER TABLE "VoiceStatus" ALTER COLUMN "downloadCount" SET DEFAULT 0,
ALTER COLUMN "downloadCount" SET DATA TYPE INTEGER,
ALTER COLUMN "verify" SET DATA TYPE VARCHAR(50),
ALTER COLUMN "dateOfCreated" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "dateOfCreated" SET DATA TYPE TIMESTAMPTZ(3),
ALTER COLUMN "dateOfUpdated" DROP NOT NULL,
ALTER COLUMN "dateOfUpdated" SET DATA TYPE TIMESTAMPTZ(3);

-- DropTable
DROP TABLE "Sentence";

-- CreateTable
CREATE TABLE "Sentance" (
    "id" SERIAL NOT NULL,
    "scriptId" INTEGER NOT NULL,
    "context" VARCHAR(5000) NOT NULL,
    "dateOfCreated" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateOfUpdated" TIMESTAMPTZ(3),

    CONSTRAINT "Sentance_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Sentance_scriptId_key" ON "Sentance"("scriptId");

-- CreateIndex
CREATE UNIQUE INDEX "Script_title_key" ON "Script"("title");

-- CreateIndex
CREATE UNIQUE INDEX "ScriptStatus_scriptId_key" ON "ScriptStatus"("scriptId");

-- CreateIndex
CREATE UNIQUE INDEX "SentenceRequirement_sentenceId_key" ON "SentenceRequirement"("sentenceId");

-- CreateIndex
CREATE UNIQUE INDEX "SentenceStatus_sentanceRequirementId_key" ON "SentenceStatus"("sentanceRequirementId");

-- CreateIndex
CREATE UNIQUE INDEX "Voice_sentenceRequirementId_key" ON "Voice"("sentenceRequirementId");

-- CreateIndex
CREATE UNIQUE INDEX "VoiceStatus_voiceId_key" ON "VoiceStatus"("voiceId");

-- AddForeignKey
ALTER TABLE "Voice" ADD CONSTRAINT "Voice_sentenceRequirementId_fkey" FOREIGN KEY ("sentenceRequirementId") REFERENCES "SentenceRequirement"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VoiceStatus" ADD CONSTRAINT "VoiceStatus_voiceId_fkey" FOREIGN KEY ("voiceId") REFERENCES "Voice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ScriptStatus" ADD CONSTRAINT "ScriptStatus_scriptId_fkey" FOREIGN KEY ("scriptId") REFERENCES "Script"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sentance" ADD CONSTRAINT "Sentance_scriptId_fkey" FOREIGN KEY ("scriptId") REFERENCES "Script"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SentenceStatus" ADD CONSTRAINT "SentenceStatus_sentanceRequirementId_fkey" FOREIGN KEY ("sentanceRequirementId") REFERENCES "SentenceRequirement"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SentenceRequirement" ADD CONSTRAINT "SentenceRequirement_sentenceId_fkey" FOREIGN KEY ("sentenceId") REFERENCES "Sentance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
