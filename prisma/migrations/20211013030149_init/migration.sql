-- CreateTable
CREATE TABLE "Voice" (
    "id" SERIAL NOT NULL,
    "fileSize" DECIMAL(65,30) NOT NULL,
    "description" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "dateOfCreated" TIMESTAMP(3) NOT NULL,
    "dateOfUpdated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Voice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VoiceStatus" (
    "id" SERIAL NOT NULL,
    "voiceId" INTEGER NOT NULL,
    "downloadCount" DECIMAL(65,30) NOT NULL,
    "clientId" INTEGER NOT NULL,
    "verify" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "dateOfCreated" TIMESTAMP(3) NOT NULL,
    "dateOfUpdated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VoiceStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Script" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "file_size" DECIMAL(65,30) NOT NULL,
    "remarks" TEXT NOT NULL,
    "clientId" INTEGER NOT NULL,
    "url" TEXT NOT NULL,
    "dateOfCreated" TIMESTAMP(3) NOT NULL,
    "dateOfUpdated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Script_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ScriptStatus" (
    "id" SERIAL NOT NULL,
    "scriptId" INTEGER NOT NULL,
    "post" BOOLEAN NOT NULL,
    "deadline" BOOLEAN NOT NULL,
    "downloadCount" DECIMAL(65,30) NOT NULL,
    "clientId" INTEGER NOT NULL,
    "dateOfCreated" TIMESTAMP(3) NOT NULL,
    "dateOfUpdated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ScriptStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Sentence" (
    "id" SERIAL NOT NULL,
    "scriptId" INTEGER NOT NULL,
    "context" TEXT NOT NULL,
    "dateOfCreated" TIMESTAMP(3) NOT NULL,
    "dateOfUpdated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Sentence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SentenceStatus" (
    "id" SERIAL NOT NULL,
    "sentanceRequirementId" INTEGER NOT NULL,
    "deadlineStatus" BOOLEAN NOT NULL,
    "dateOfCreated" TIMESTAMP(3) NOT NULL,
    "dateOfUpdated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SentenceStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SentenceRequirement" (
    "id" SERIAL NOT NULL,
    "language" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "gender" TEXT NOT NULL,
    "sentanceId" INTEGER NOT NULL,
    "voiceId" INTEGER NOT NULL,
    "dateOfCreated" TIMESTAMP(3) NOT NULL,
    "dateOfUpdated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SentenceRequirement_pkey" PRIMARY KEY ("id")
);
