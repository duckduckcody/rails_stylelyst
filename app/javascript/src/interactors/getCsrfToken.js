export default function getCsrfToken(context) {
  context.csrfToken = document.head.querySelector(
    "[name='csrf-token']"
  ).content;
  return context;
}
