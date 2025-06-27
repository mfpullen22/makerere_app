/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

const functions = require("firebase-functions");
const axios = require("axios");
const FormData = require("form-data");

exports.sendReviewEmailWithMailgun = functions.https.onCall(async (data, context) => {
  const { email, csv } = data;
  const mailgunApiKey = functions.config().mailgun.api_key;
  const domain = functions.config().mailgun.domain;

  const form = new FormData();
  form.append("from", `Admin <admin@${domain}>`);
  form.append("to", email);
  form.append("subject", "Exported Student Reviews");
  form.append("text", "Attached is the CSV file with review data.");
  form.append("attachment", Buffer.from(csv), {
    filename: "reviews.csv",
    contentType: "text/csv",
  });

  const auth = Buffer.from(`api:${mailgunApiKey}`).toString("base64");

  try {
    await axios.post(`https://api.mailgun.net/v3/${domain}/messages`, form, {
      headers: {
        ...form.getHeaders(),
        Authorization: `Basic ${auth}`,
      },
    });
    return { success: true };
  } catch (err) {
    console.error("Mailgun error:", err.response?.data || err.message);
    throw new functions.https.HttpsError("internal", "Email send failed");
  }
});


// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
