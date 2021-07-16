const cds = require('@sap/cds');

module.exports = cds.service.impl(srv => {

    const { Phones } = srv.entities('my.phoneshop');

    srv.after('READ', 'Phones', each => {
        if (each.stock > 99) {
            each.title += ' --- 10% discount !!!';
        }
    })

    srv.after('READ', 'Watches', each => {
        if (each.price) {
            each.title += ' --- nice watch, man :D'
        }
    })

    srv.before('CREATE', 'Orders', async req => {
        const { phone_ID, amount } = req.data;
        const [phone] = await cds.transaction(req).run(
            SELECT.from(Phones)
            .where({ ID: phone_ID })
        )

        if (!phone) {
            return req.error(404, 'Phone not found!');
        }

        const updatedPhone = await cds.transaction(req).run(
            UPDATE(Phones)
            .where({ ID: phone_ID })
            .and('stock >=', amount)
            .set('stock -=', amount)
        )

        if (updatedPhone === 0) {
            return req.error(400, `Not enough phones! We have only ${phone.stock}`);
        }
    })
})