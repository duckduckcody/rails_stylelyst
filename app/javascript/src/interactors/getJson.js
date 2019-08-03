import getJsonHeaders from "./getJsonHeaders";

export default function getJson(context) {
  return new Promise((resolve, reject) => {
    const { jsonHeaders } = getJsonHeaders(context);
    let request = new Request(context.url, {
      method: "GET",
      ...jsonHeaders
    });
    fetch(request)
      .then(res => res.json())
      .then(json => {
        context.json = json;
        resolve(context);
      });
  });
}
