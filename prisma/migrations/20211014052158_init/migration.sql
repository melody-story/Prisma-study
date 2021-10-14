-- AlterTable
ALTER TABLE "ScriptStatus" ADD COLUMN     "download_max" INTEGER,
ADD COLUMN     "download_preiod_from" DATE,
ADD COLUMN     "download_preiod_to" DATE;

-- AlterTable
ALTER TABLE "VoiceStatus" ADD COLUMN     "playCount" INTEGER NOT NULL DEFAULT 0;
