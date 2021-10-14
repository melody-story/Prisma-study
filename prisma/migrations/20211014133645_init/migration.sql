/*
  Warnings:

  - You are about to drop the column `sentanceRequirementId` on the `SentenceStatus` table. All the data in the column will be lost.
  - You are about to drop the column `sentenceRequirementId` on the `Voice` table. All the data in the column will be lost.
  - You are about to drop the `Sentance` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SentenceRequirement` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[requiredSentenceId]` on the table `SentenceStatus` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[requiredSentenceId]` on the table `Voice` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `requiredSentenceId` to the `SentenceStatus` table without a default value. This is not possible if the table is not empty.
  - Added the required column `requiredSentenceId` to the `Voice` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Sentance" DROP CONSTRAINT "Sentance_scriptId_fkey";

-- DropForeignKey
ALTER TABLE "SentenceRequirement" DROP CONSTRAINT "SentenceRequirement_sentenceId_fkey";

-- DropForeignKey
ALTER TABLE "SentenceStatus" DROP CONSTRAINT "SentenceStatus_sentanceRequirementId_fkey";

-- DropForeignKey
ALTER TABLE "Voice" DROP CONSTRAINT "Voice_sentenceRequirementId_fkey";

-- DropIndex
DROP INDEX "SentenceStatus_sentanceRequirementId_key";

-- DropIndex
DROP INDEX "Voice_sentenceRequirementId_key";

-- AlterTable
ALTER TABLE "SentenceStatus" DROP COLUMN "sentanceRequirementId",
ADD COLUMN     "requiredSentenceId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Voice" DROP COLUMN "sentenceRequirementId",
ADD COLUMN     "requiredSentenceId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Sentance";

-- DropTable
DROP TABLE "SentenceRequirement";

-- CreateTable
CREATE TABLE "Sentence" (
    "id" SERIAL NOT NULL,
    "scriptId" INTEGER NOT NULL,
    "context" VARCHAR(5000) NOT NULL,
    "dateOfCreated" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateOfUpdated" TIMESTAMPTZ(3),

    CONSTRAINT "Sentence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RequiredSentence" (
    "id" SERIAL NOT NULL,
    "language" VARCHAR(50) NOT NULL,
    "age" INTEGER,
    "gender" VARCHAR(50),
    "sentenceId" INTEGER NOT NULL,
    "dateOfCreated" TIMESTAMPTZ(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateOfUpdated" TIMESTAMPTZ(3),

    CONSTRAINT "RequiredSentence_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Sentence_scriptId_key" ON "Sentence"("scriptId");

-- CreateIndex
CREATE UNIQUE INDEX "RequiredSentence_sentenceId_key" ON "RequiredSentence"("sentenceId");

-- CreateIndex
CREATE UNIQUE INDEX "SentenceStatus_requiredSentenceId_key" ON "SentenceStatus"("requiredSentenceId");

-- CreateIndex
CREATE UNIQUE INDEX "Voice_requiredSentenceId_key" ON "Voice"("requiredSentenceId");

-- AddForeignKey
ALTER TABLE "Voice" ADD CONSTRAINT "Voice_requiredSentenceId_fkey" FOREIGN KEY ("requiredSentenceId") REFERENCES "RequiredSentence"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sentence" ADD CONSTRAINT "Sentence_scriptId_fkey" FOREIGN KEY ("scriptId") REFERENCES "Script"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SentenceStatus" ADD CONSTRAINT "SentenceStatus_requiredSentenceId_fkey" FOREIGN KEY ("requiredSentenceId") REFERENCES "RequiredSentence"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RequiredSentence" ADD CONSTRAINT "RequiredSentence_sentenceId_fkey" FOREIGN KEY ("sentenceId") REFERENCES "Sentence"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
