import http from "k6/http";
import { check } from "k6";

export const options = {
  stages: [
    { duration: "2m", target: 10 },
    { duration: "5m", target: 10 },
    { duration: "2m", target: 50 },
    { duration: "5m", target: 50 },
  ],
};

export default function () {
  const response = http.get("http://localhost:3000/health");
  check(response, {
    "status is 200": (r) => r.status === 200,
  });
}