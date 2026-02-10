import { test, expect } from "@playwright/test";

test("health check returns healthy", async ({ page }) => {
  await page.goto("/health");
  const response = await page.evaluate(async () => {
    const res = await fetch("/health");
    return res.json();
  });
  expect(response.status).toBe("healthy");
});

test("API endpoint works", async ({ request }) => {
  const response = await request.get("/api");
  expect(response.ok()).toBeTruthy();
});