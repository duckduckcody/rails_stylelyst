import getCsrkToken from "./getCsrfToken";

export default function getJsonHeaders(context) {
  const { csrfToken } = getCsrkToken(context);
  context.jsonHeaders = {
    headers: new Headers({
      "Content-Type": "application/json",
      "X-Requested-With": "XMLHttpRequest",
      "X-CSRF-Token": csrfToken
    }),
    credentials: "same-origin"
  };
  return context;
}
