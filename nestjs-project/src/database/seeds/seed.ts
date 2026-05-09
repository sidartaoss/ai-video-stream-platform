import { AppDataSource } from '../data-source';

async function runSeed(): Promise<void> {
  await AppDataSource.initialize();
  console.log('Database connection initialized');
  try {
    // seed functions here
  } finally {
    await AppDataSource.destroy();
    console.log('Database connection closed');
  }
}

runSeed().catch((error: unknown) => {
  console.error('Error during seed:', error);
  process.exit(1);
});
