import { test, expect } from "@playwright/test";

test("homepage loads", async ({ page }) => {
  await page.goto("/");
  await expect(page).toHaveTitle(/Auto-deployment/);
});

test("navigation works", async ({ page }) => {
  await page.goto("/");
  const heading = page.locator("h1").first();
  await expect(heading).toBeVisible();
});